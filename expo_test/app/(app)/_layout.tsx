import { Text } from "react-native";
import { Redirect, Stack } from "expo-router";

import { useAuth } from "@/components/Auth";
import React from "react";

export default function AppLayout() {
  const { auth, loading } = useAuth();

  // You can keep the splash screen open, or render a loading screen like we do here.
  if (loading) {
    return <Text>Loading...</Text>;
  } else if (auth === null || auth.jwt === "") {
    // On web, static rendering will stop here as the user is not authenticated
    // in the headless Node process that the pages are rendered in.
    return <Redirect href="/login" />;
  }

  // This layout can be deferred because it's not the root layout.
  return <Stack />;
}
