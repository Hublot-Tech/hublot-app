import React from 'react';
import { Search } from '../atomics/search';

export default  function Filter({
  title,
  searchParams,
}: {
  title: string;
  searchParams: { q: string };
}) {
  return (
    <div className="filter">
      <div className="head">
        <div className="filter__title  mb-8">
          <h1 className="font-semibold ">{title}</h1>
        </div>
      </div>

      <div className="filter-section">
        <div className="w-full mb-4">
          <div className="w-full mb-4">
            <Search value={searchParams.q} />
          </div>
          
        </div>
      </div>
    </div>
  );
}
