class AppSecrets {
  static const supabaseUrl = 'https://lameuhomtfcfalfidkxg.supabase.co';
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxhbWV1aG9tdGZjZmFsZmlka3hnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc1MzIxNDYsImV4cCI6MjA0MzEwODE0Nn0.YmPPmMSwb9DWSJ5H5Y3aWzGXU_3dmuolX4X9qhUS4gQ';
  static String baseExoplanetUrl =
      'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year>=2024+and+disc_year<=2024&format=json';
}
