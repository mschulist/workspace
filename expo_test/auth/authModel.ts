export type LoginRequest = {
  uuid: string;
  password: string;
};

export type AuthModel = {
  jwt: string;
};

export type SessionModel = {
  auth: AuthModel | null;
  loading: boolean;
  user: User | null;
};

export type User = {
  uuid: string;
  email: string;
  password: string;
  id: string;
  phone: string;
  firstName: string;
  lastName: string;
  purchases: Purchase[];
  currentPoints: number;
  admin: boolean;
}

export type Purchase = {
  datetime: Date;
  id: string;
  properties: Map<string, string>;
}