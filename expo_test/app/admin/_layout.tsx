import { Text } from "react-native";
import { Redirect, Slot, Stack } from "expo-router";

import { Auth, useAuth } from "@/components/Auth";
import React from "react";
import { ActivityIndicator, MD2Colors } from "react-native-paper";
import AdminHome from ".";

export default function AppLayout() {
  const { auth, loading } = useAuth();

  // You can keep the splash screen open, or render a loading screen like we do here.
  if (loading) {
    return <ActivityIndicator animating={true} color={MD2Colors.red800} />;
  }
  return (
    <Auth>
      <AdminHome />
    </Auth>
  );
}
