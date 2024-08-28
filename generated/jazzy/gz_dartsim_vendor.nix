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
        rev = "38bdb4c6948952978b640c95beb7b4e8aaea61f3";
        hash = "sha256-M1p+knNPSpbfQpQATwwHo5EqtCKx0Fn9S7rZLTTWICY=";
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
  version = "0.0.2-1";
  src = sources.gz_dartsim_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ eigen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp bullet fcl fmt libccd lz4 ode python3Packages.boost tinyxml-2 urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
}
