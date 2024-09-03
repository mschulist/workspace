import { Slot, Stack } from "expo-router";
import React from "react";
import { Auth } from "@/components/Auth";
import { PaperProvider } from "react-native-paper";

export default function Root() {
  return (
    <PaperProvider>
      <Auth>
        <Slot />
      </Auth>
    </PaperProvider>
  );
}
