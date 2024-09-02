import { Slot, Stack } from "expo-router";
import React from "react";
import { Auth } from "@/components/Auth";

export default function Root() {
  return (
    <Auth>
      <Slot />
    </Auth>
  );
}
