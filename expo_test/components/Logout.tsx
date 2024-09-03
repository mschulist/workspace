import { clearAuth } from "@/auth/localAuth";
import React from "react";
import { Button, Text } from "react-native-paper";
import { useAuth } from "./Auth";

export function Logout() {
  const { logout } = useAuth();
  return (
    <Button mode="contained-tonal" onPress={logout}>
      Logout
    </Button>
  );
}
