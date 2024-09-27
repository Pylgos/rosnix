{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tcb_span-6512481c861c90c5702c8baf994a281b9df9d022 = substituteSource {
      src = fetchgit {
        name = "tcb_span-6512481c861c90c5702c8baf994a281b9df9d022-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "6512481c861c90c5702c8baf994a281b9df9d022";
        hash = "sha256-61JrUYgWw+LJJmryzDfZte0H+hhzDbHqOY1wEyk996Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tcb_span";
  version = "1.0.2-4";
  src = sources.tcb_span-6512481c861c90c5702c8baf994a281b9df9d022;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of C++20's std::span";
  };
}
