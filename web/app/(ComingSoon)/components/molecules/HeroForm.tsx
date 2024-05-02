import React from 'react'

function HeroForm() {
    const Towns = ["Douala", "Yaounde", "Bafoussam", "Bamenda", "Buea", "Dschang", "Limbe", "Kribi", "Edea", "Nkongsamba", "Maroua", "Garoua", "Ngaoundere", "Bertoua", 
    "Bafang", "Foumban", "Ebolowa", "Kumba", "Mamfe", "Batouri", "Mbalmayo", "Meiganga", "Mokolo", "Ngaoundal", "Obala"]
  return (
    <form className="flex flex-col space-y-4 max-w-lg" action="https://public.herotofu.com/v1/7030cff0-fbdf-11ee-bf9d-5f9a26e8739d" method="post" accept-charset="UTF-8">
        {/* Hero section form asking for Service and Town */}
        <div className="flex flex-col space-y-2">
          <input type="text" id="service" name="Service" className="p-2 border border-gray-300 rounded-lg focus:border-primary focus:ring-yellow-500" 
            placeholder='Quel service rechechez-vous ?' />
        </div>
        {/* select town */}
        <div className="flex flex-col space-y-2">
          <select id="town" name="town" className="p-2 border border-gray-300 rounded-lg">
            {Towns.map((town, index) => (
              <option key={index} value={town}>{town}</option>
            ))}
          </select>
        </div>

        <div className='md:'>
          <button type="submit" className="p-2 bg-primary text-gray-900 font-normal rounded-sm hover:bg-yellow-300 shadow-lg">Envoyer mon choix</button>
        </div>

        <div>
              <input type="submit" value="Download CTA" />
              <div
                style={{ textIndent: '-99999px', whiteSpace: 'nowrap', overflow: 'hidden', position: 'absolute' }}
                aria-hidden="true"
              >
                <input
                  type="text"
                  name="_gotcha"
                  tabIndex={-1}
                  autoComplete="off"
                />
              </div>
            </div>
    </form>
  )
}

export default HeroForm