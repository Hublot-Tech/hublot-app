import { JwtAuthGuardGuard } from './jwt-auth-guard.guard';

describe('JwtAuthGuardGuard', () => {
  it('should be defined', () => {
    expect(new JwtAuthGuardGuard()).toBeDefined();
  });
});
