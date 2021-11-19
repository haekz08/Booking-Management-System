export default {
  items: [
    {
      name: 'Dashboard',
      url: '/dashboard',
      icon: 'icon-speedometer',
      badge: {
        variant: 'primary',
      }
    },
    {
          name: 'System Routes',
          url: '/system-routes',
          icon: 'fa fa-map-signs',
          badge: {
              variant: 'primary',
          }
      },
    {
      title: true,
      name: 'Theme',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
        name: 'Settings',
        url: '/settings',
        icon: 'fa fa-cogs',
        children: [
            {
                name: 'Boat Models',
                url: '/boat-models',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Boat Types',
                url: '/boat-types',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Boat Brands',
                url: '/boat-brands',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Cabin Types',
                url: '/cabin-types',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Nationalities',
                url: '/nationalities',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Guest Titles',
                url: '/guest-titles',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Diet Options',
                url: '/guest-options',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Payment Types',
                url: '/payment-types',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'ID Types',
                url: '/identification-card-types',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Crew Types',
                url: '/crew-types',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Inclusions',
                url: '/inclusions',
                icon: 'fa fa-angle-double-right'
            },
            {
                name: 'Exclusions',
                url: '/exclusions',
                icon: 'fa fa-angle-double-right'
            },
        ]
    },
    {
        name: 'Boats',
        url: '/boats',
        icon: 'fa fa-ship'
    }
  ]
}
