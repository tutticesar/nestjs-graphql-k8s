import { Controller, Get, ServiceUnavailableException } from '@nestjs/common';
import { AppService } from './app.service';
import { DbService } from './db.service';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly db: DbService,
  ) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('health')
  async healthCheck(): Promise<{ status: string }> {
    try {
      await this.db.check();
      return { status: 'ok' };
    } catch (e) {
      throw new ServiceUnavailableException('Database is not reachable');
    }
  }
}
