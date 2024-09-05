import { Text } from "react-native";
import { Redirect, Slot, Stack } from "expo-router";

import { Auth, useAuth } from "@/components/Auth";
import React, { useEffect } from "react";
import { ActivityIndicator, MD2Colors } from "react-native-paper";
import Home from ".";

export default function AppLayout() {
  const { auth, loading } = useAuth();

  // You can keep the splash screen open, or render a loading screen like we do here.
  if (loading) {
    return <ActivityIndicator animating={true} color={MD2Colors.red800} />;
  } else if (auth === null || auth.jwt === "") {
    // On web, static rendering will stop here as the user is not authenticated
    // in the headless Node process that the pages are rendered in.
    return <Redirect href="/login" />;
  }
  return (
    <Auth>
      <Home />
    </Auth>
  );
}
