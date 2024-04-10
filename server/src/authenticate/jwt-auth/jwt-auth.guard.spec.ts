import { JwtAuthGuard } from "./jwt-auth.guard";

describe("JwtAuthGuardGuard", () => {
  it("should be defined", () => {
    expect(new JwtAuthGuard()).toBeDefined();
  });
});
