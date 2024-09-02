import { AuthModel, SessionModel, User } from "@/auth/authModel";
import { getAuth } from "@/auth/localAuth";
import { getUserData } from "@/auth/login";
import { createContext, useContext, useEffect, useState } from "react";
import React from "react";

const AuthContext = createContext<SessionModel>({
  auth: null,
  loading: true,
  user: null,
});

export function Auth(props: { children: React.ReactNode }): React.ReactElement {
  const [auth, setAuth] = useState<AuthModel | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Load auth from secure storage
    getAuth().then((auth) => {
      setAuth(auth);
      setLoading(false);
    });
  }, []);

  useEffect(() => {
    if (auth?.jwt !== "" && auth?.jwt !== undefined) {
      getUserData(auth.jwt).then((user) => {
        setUser(user);
      });
    }
  }, [auth]);

  return (
    <AuthContext.Provider value={{ auth, loading, user }}>
      {props.children}
    </AuthContext.Provider>
  );
}

export function useAuth(): SessionModel {
  return useContext(AuthContext);
}
