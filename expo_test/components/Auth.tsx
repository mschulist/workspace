import { AuthModel, SessionModel, User } from "@/auth/authModel";
import { clearAuth, getAuth, setLocalAuth } from "@/auth/localAuth";
import { getUserData, loginWithServer, signup } from "@/auth/login";
import { router } from "expo-router";
import { createContext, useContext, useEffect, useState } from "react";
import React from "react";

const AuthContext = createContext<SessionModel>({
  auth: null,
  loading: true,
  user: null,
  logout: () => {},
  setAuth: () => {},
  getUser: () => {},
  login: () => {},
});

export function Auth(props: { children: React.ReactNode }): React.ReactElement {
  const [authModel, setAuthModel] = useState<AuthModel | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    console.log("Auth useEffect");
    console.log("AuthModel: ", authModel);
    if (authModel === null || authModel.jwt === "") {
      getAuth().then((auth) => {
        if (auth === null) {
          setLoading(false);
          return;
        }
        setAuthModel(auth);
        setLoading(false);
      });
    }
    if (authModel === null || authModel.jwt === "") {
      return;
    }
    getUserData(authModel.jwt).then((user) => {
      console.log("User: ", user);
      setUser(user);
      setLoading(false);
      if (user.admin === true) {
        router.replace("/admin");
      } else {
        router.replace("/user");
      }
    });
  }, []);

  function login(studentID: string, password: string) {
    loginWithServer(studentID, password)
      .then((auth) => {
        setAuthModel(auth);
        setLocalAuth(auth);
        getUserData(auth.jwt).then((user) => {
          setUser(user);
          setLocalAuth(auth);
          console.log("Login Auth: ", auth);
          setLoading(false);
          if (user.admin === true) {
            router.replace("/admin");
          } else {
            router.replace("/user");
          }
        });
      })
      .catch((e) => {
        alert(e as string);
      });
  }

  function logout() {
    clearAuth();

    setAuthModel(null);
    setUser(null);
    setLoading(false);
  }

  function setAuth(auth: AuthModel) {
    setAuthModel(auth);
  }

  function getUser() {
    if (authModel === null || authModel.jwt === "") {
      return;
    }
    getUserData(authModel.jwt).then((user) => {
      setUser(user);
    });
  }

  return (
    <AuthContext.Provider
      value={{
        auth: authModel,
        loading,
        user,
        logout,
        setAuth,
        getUser,
        login,
      }}
    >
      {props.children}
    </AuthContext.Provider>
  );
}

export function useAuth(): SessionModel {
  return useContext(AuthContext);
}
