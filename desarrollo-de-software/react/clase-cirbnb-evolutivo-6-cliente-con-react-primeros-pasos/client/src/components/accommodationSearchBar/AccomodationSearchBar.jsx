import React, { useEffect, useState } from 'react'
import './AccomodationSearchBar.css';
import { FaMapMarkerAlt, FaSearch } from 'react-icons/fa';
import {Button, TextField} from '@mui/material'

const AccomodationSearchBar = () => {
  const[searchText, setSearchText] = useState("");
  return (
    <div className="accommodation-search">
      <div className='search-field'>
        <label className='field-label'>DESTINO</label>
        <div className='input-wrapper'>
          <FaMapMarkerAlt className='search-icon' />

          <TextField
            value={""}
            onChange={(e)=>setSearchText(e.target.value)}
            fullWidth
            variant='standard'
            placeholder='donde vas?'
          />
          
        </div>
      </div>
      
      <Button className='search-button'>
        <FaSearch className='button-icon' />
        Buscar
      </Button>
    </div>
  )
}

export default AccomodationSearchBar
