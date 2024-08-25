{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  assimp,
  buildRosPackage,
  bullet,
  eigen,
  fcl,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  libccd,
  lz4,
  ode,
  python3Packages,
  substituteSource,
  tinyxml-2,
  urdfdom,
}:
let
  sources = rec {
    gz_dartsim_vendor = substituteSource {
      src = fetchgit {
        name = "gz_dartsim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_dartsim_vendor-release.git";
        rev = "cc443f34ca4bfb21fbedfe22d2adf3468a76fb1f";
        hash = "sha256-GNwTMUXXWeR4GBVg3fGvXRTdMbMq340+qIujVA/HiYI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/dartsim/dart.git";
          to = "VCS_TYPE path VCS_URL ${gz_dartsim_vendor-vendor_source-dart-0}";
        }
      ];
    };
    gz_dartsim_vendor-vendor_source-dart-0 = substituteSource {
      src = fetchgit {
        name = "gz_dartsim_vendor-vendor_source-dart-0-source";
        url = "https://github.com/dartsim/dart.git";
        rev = "a51e08c210d7892605c6dc0b9ae96fce4446d9fe";
        hash = "sha256-AfKPqUiW6BsM98TIzTY2ZcFP1WvURs8/dGOzanIiB9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_dartsim_vendor";
  version = "0.1.1-1";
  src = sources.gz_dartsim_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp bullet eigen fcl fmt libccd lz4 ode python3Packages.boost tinyxml-2 urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
}
