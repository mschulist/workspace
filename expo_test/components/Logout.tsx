import { clearAuth } from "@/auth/localAuth";
import React from "react";
import { Button, Text } from "react-native-paper";

export function Logout() {
  return (
    <Button
      mode="contained-tonal"
      onPress={() => {
        clearAuth();
      }}
    >
      Logout
    </Button>
  );
}
