{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_vendor_package-97482c1209ed7cf762456a67198edcbfe360e6ea = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-97482c1209ed7cf762456a67198edcbfe360e6ea-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "97482c1209ed7cf762456a67198edcbfe360e6ea";
        hash = "sha256-KkTE1QQazWtE0GfTss356rNFZaYbrqRkSkq8CMhAeU8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "2.5.2-1";
  src = sources.ament_cmake_vendor_package-97482c1209ed7cf762456a67198edcbfe360e6ea;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-vcstool" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-vcstool" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
}
