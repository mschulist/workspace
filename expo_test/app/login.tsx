import { Login } from "@/components/Login";
import React from "react";
import { Text, View } from "react-native";
import { Router } from "expo-router";
import { useAuth } from "@/components/Auth";
import { Card } from "react-native-paper";

export default function LoginPage() {
  return <Login />;
}
