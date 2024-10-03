import { User } from "@/auth/authModel";
import { useAuth } from "./Auth";
import React, { useState } from "react";
import { Card, Text, Button, TextInput } from "react-native-paper";
import { addPurchase } from "@/auth/addPurchase";

export function AdminAddPurchase({ user }: { user: User }) {
  const [points, setPoints] = useState("");
  const [purchaseID, setPurchaseID] = useState("");

  const { auth } = useAuth();

  function handleAddPurchase() {
    if (auth === null) {
      return;
    }
    addPurchase(user.uuid, parseInt(points), auth.jwt, purchaseID);
  }

  return (
    <Card>
      <TextInput
        label="Points"
        value={points}
        onChangeText={(text) => setPoints(text.replace(/[^0-9]/g, ""))}
        keyboardType="numeric"
      />
      <TextInput
        label="Purchase ID"
        value={purchaseID}
        onChangeText={(text) => setPurchaseID(text.replace(/[^0-9]/g, ""))}
        keyboardType="numeric"
      />
      <Button
        mode="contained"
        onPress={handleAddPurchase}
        disabled={points === "" || purchaseID === ""}
      >
        Add Purchase for {user.first_name} {user.last_name}
      </Button>
    </Card>
  );
}
