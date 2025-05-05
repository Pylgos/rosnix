{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libphidget22";
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."libphidget22";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libusb-1.0" "libusb-1.0-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0" "libusb-1.0-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libphidget22" = substituteSource {
      src = fetchgit {
        name = "libphidget22-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "f325a1971b200ca0531ddcbdc51241c1e6a2d3e5";
        hash = "sha256-6qmEwpvLQ3uNtKDMaZipmO91nKI98FLjFSl0zWR+tCk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
          to = "URL ${sources."libphidget22/libphidget22-1"}";
        }
      ];
    };
    "libphidget22/libphidget22-1" = substituteSource {
      src = fetchzip {
        name = "libphidget22-1-source";
        url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
        hash = "sha256-TQg72tGQsU7ygESyh3gR68l+RXNF4uDHR/tj5vVlXY0=";
      };
    };
  });
  meta = {
    description = "This package wraps the libphidget22 to use it as a ROS dependency";
  };
})
