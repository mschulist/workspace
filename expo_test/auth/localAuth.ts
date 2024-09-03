import { getItemAsync, setItemAsync } from "expo-secure-store";
import { AuthModel } from "./authModel";
import { router } from "expo-router";

const AUTH_KEY = "auth_key";

export async function setLocalAuth(auth: AuthModel) {
  setItemAsync(AUTH_KEY, JSON.stringify(auth));
}

export async function getAuth(): Promise<AuthModel | null> {
  const auth = await getItemAsync(AUTH_KEY);
  if (auth === null || auth === "") {
    return null;
  }
  return JSON.parse(auth);
}

export async function clearAuth() {
  setItemAsync(AUTH_KEY, "");
  router.replace("/login");
}
