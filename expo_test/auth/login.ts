import { router } from "expo-router";
import { LoginRequest, User } from "./authModel";
import { setAuth } from "./localAuth";

export const SERVER_URL = "http://localhost:8000";

export async function login(
  studentID: string,
  password: string
): Promise<void> {
  const loginRequest: LoginRequest = {
    uuid: studentID,
    password: password,
  };
  return fetch(`${SERVER_URL}/login`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(loginRequest),
  }).then(async (response) => {
    if (response.status === 200) {
      const res = await response.json();
      console.log(res);
      setAuth({ jwt: res.jwt });
      router.replace("/");
    } else {
      throw new Error("Login failed");
    }
  });
}

export async function getUserData(jwt: string): Promise<User> {
  return fetch(`${SERVER_URL}/getuser`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: jwt,
    },
  }).then(async (response) => {
    if (response.status === 200) {
      const res = await response.json();
      return res as User;
    } else {
      console.log(response);
      throw new Error("Get user data failed");
    }
  });
}
