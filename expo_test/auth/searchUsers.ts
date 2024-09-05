import { useAuth } from "@/components/Auth";
import { AuthModel, User } from "./authModel";
import { SERVER_URL } from "./login";

export async function searchUsers(uuid: string, auth: AuthModel): Promise<User[]> {
  if (!auth) {
    console.error("No auth");
    return [];
  }
  const uri = `${SERVER_URL}/getuseradmin`;
  console.log(uri);
  const users = await fetch(uri, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: auth.jwt,
    },
    body: JSON.stringify({ uuid }),
  }).then(async (response) => {
    if (response.status === 200) {
      const res = await response.json();
      console.log(res);
      return res as User[];
    } else {
      console.log(response);
      throw new Error("Search users failed");
    }
  });
  return users;
}
