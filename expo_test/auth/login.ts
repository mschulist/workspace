import { router } from "expo-router";
import { LoginRequest, SignupRequest, User } from "./authModel";

export const SERVER_URL = "http://localhost:8000";

// used by auth provider
export async function loginWithServer(
  studentID: string,
  password: string
): Promise<{jwt: string}> {
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
      return res as { jwt: string };
    } else {
      throw new Error("Login failed");
    }
  });
}

// to be used by the auth provider
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

// used by components
export async function signup(
  signupDetails: SignupRequest,
  setAuth: (auth: { jwt: string }) => void
): Promise<void> {
  return fetch(`${SERVER_URL}/adduser`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(signupDetails),
  }).then(async (response) => {
    if (response.status === 200) {
      const res = await response.json();
      console.log(res);
      setAuth({ jwt: res.jwt });
      router.replace("/user");
    } else {
      throw new Error("Signup failed");
    }
  });
}
