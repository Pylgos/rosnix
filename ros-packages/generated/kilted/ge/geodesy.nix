{
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geodesy";
  version = "1.0.6-2";
  src = finalAttrs.passthru.sources."geodesy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geographic-msgs geometry-msgs sensor-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg" "python3-pyproj" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geographic-msgs geometry-msgs sensor-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg" "python3-pyproj" ]; };
  passthru.sources = mkSourceSet (sources: {
    "geodesy" = substituteSource {
      src = fetchgit {
        name = "geodesy-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "fe6affa33042a50fa4b444c01de631508d558f51";
        hash = "sha256-+iSI/nF1U9zJNt1tRwph3J72AI6GDwamBRol2QrwTUY=";
      };
    };
  });
  meta = {
    description = "\n    Python and C++ interfaces for manipulating geodetic coordinates.\n  ";
  };
})
