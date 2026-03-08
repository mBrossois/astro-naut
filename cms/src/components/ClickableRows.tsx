'use client'
import { useEffect, type ReactNode } from 'react'
import { useRouter, usePathname } from 'next/navigation'

interface Props {
  children: ReactNode
}

const ClickableRowsProvider: React.FC<Props> = ({ children }) => {
  const router = useRouter()
  const pathname = usePathname()

  useEffect(() => {
    const handleRowClick = (e: MouseEvent) => {
      const target = e.target as HTMLElement
      
      if (
        target.closest('a') ||
        target.closest('button') ||
        target.closest('input') ||
        target.closest('.checkbox')
      ) {
        return
      }

      const row = target.closest('tr')
      if (!row) return

      const link = row.querySelector('a[href*="/collections/"]') as HTMLAnchorElement
      if (link?.href) {
        router.push(link.href)
      }
    }

    const tables = document.querySelectorAll('.table tbody')
    tables.forEach((tbody) => {
      tbody.addEventListener('click', handleRowClick as EventListener)
    })

    return () => {
      tables.forEach((tbody) => {
        tbody.removeEventListener('click', handleRowClick as EventListener)
      })
    }
  }, [router, pathname])

  return <>{children}</>
}

export default ClickableRowsProvider
