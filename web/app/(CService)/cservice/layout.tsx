import Aside from '../components/ui/common/Aside';

export const metadata = {
  title: 'C.Service - Hublots CM',
  description: 'Gestionnaire de Services clients de la société Hublots CM',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <main className='flex min-h-screen'>
        <Aside />
        <div className='ml-64 flex flex-1 flex-col p-4 md:p-6'>
            {children}
        </div>
    </main>
  );
}
