import { AuthModel, SessionModel, User } from "@/auth/authModel";
import { clearAuth, getAuth } from "@/auth/localAuth";
import { getUserData, login, signup } from "@/auth/login";
import { createContext, useContext, useEffect, useState } from "react";
import React from "react";
import { get } from "react-native/Libraries/TurboModule/TurboModuleRegistry";

const AuthContext = createContext<SessionModel>({
  auth: null,
  loading: true,
  user: null,
  logout: () => {},
  setAuth: () => {},
  getUser: () => {},
});

export function Auth(props: { children: React.ReactNode }): React.ReactElement {
  const [authModel, setAuthModel] = useState<AuthModel | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Load auth from secure storage
    getAuth().then((auth) => {
      setAuthModel(auth);
      setLoading(false);
    });
  }, []);

  useEffect(() => {
    if (authModel?.jwt !== "" && authModel?.jwt !== undefined) {
      getUserData(authModel.jwt).then((user) => {
        console.log("User: ", user.purchases);
        setUser(user);
      });
    }
  }, [authModel]);

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
      value={{ auth: authModel, loading, user, logout, setAuth, getUser }}
    >
      {props.children}
    </AuthContext.Provider>
  );
}

export function useAuth(): SessionModel {
  return useContext(AuthContext);
}
