import { User } from "@/auth/authModel";
import React, { useState } from "react";
import { Button, Card, Text, TextInput } from "react-native-paper";

export function AdminRedeem({ user }: { user: User }) {
  // number of points to redeem
  const [points, setPoints] = useState("10");

  return (
    <>
      <Card>
        <TextInput
          label="Points"
          value={points}
          onChangeText={(text) => setPoints(text.replace(/[^0-9]/g, ""))}
          keyboardType="numeric"
        />
        <Button
          mode="contained"
          onPress={() => {
            alert(
              "Redeem Points for " + user.first_name + " " + user.last_name
            );
          }}
        >
          Redeem Points for {user.first_name} {user.last_name}
        </Button>
      </Card>
    </>
  );
}
