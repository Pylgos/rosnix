{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_dartsim_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_dartsim_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_dartsim_vendor-release";
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
      src = fetchFromGitHub {
        name = "gz_dartsim_vendor-vendor_source-dart-0-source";
        owner = "dartsim";
        repo = "dart";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "bullet" "eigen" "fmt" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
}
