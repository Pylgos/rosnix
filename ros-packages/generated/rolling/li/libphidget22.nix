{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libphidget22-7a80edfd8ff3c11bd58427f7e5cdac6853d48f7b = substituteSource {
      src = fetchgit {
        name = "libphidget22-7a80edfd8ff3c11bd58427f7e5cdac6853d48f7b-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "7a80edfd8ff3c11bd58427f7e5cdac6853d48f7b";
        hash = "sha256-6qmEwpvLQ3uNtKDMaZipmO91nKI98FLjFSl0zWR+tCk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
          to = "URL ${libphidget22_1-vendor_source-13axcpsycqzv8z3y1qj5fd2pxjgb25w8gcj4h3r4xcchs7d3n22d}";
        }
      ];
    };
    libphidget22_1-vendor_source-13axcpsycqzv8z3y1qj5fd2pxjgb25w8gcj4h3r4xcchs7d3n22d = substituteSource {
      src = fetchzip {
        name = "libphidget22_1-vendor_source-13axcpsycqzv8z3y1qj5fd2pxjgb25w8gcj4h3r4xcchs7d3n22d-source";
        url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
        hash = "sha256-TQg72tGQsU7ygESyh3gR68l+RXNF4uDHR/tj5vVlXY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libphidget22";
  version = "2.3.3-1";
  src = sources.libphidget22-7a80edfd8ff3c11bd58427f7e5cdac6853d48f7b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0" "libusb-1.0-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package wraps the libphidget22 to use it as a ROS dependency";
  };
}
