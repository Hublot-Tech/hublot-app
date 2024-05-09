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
    <main className='flex flex-col min-h-screen items-center justify-between '>
        <Aside />
        <div className='ml-64'>
            {children}
        </div>
    </main>
  );
}
