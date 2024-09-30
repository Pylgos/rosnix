{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "geographic_msgs" = substituteSource {
      src = fetchgit {
        name = "geographic_msgs-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "1efe3b2b34b48437bc1af05abe67bbbf832c9957";
        hash = "sha256-nhS4kFuDj1V2F56pjP2GmIYfCB+bVsr1RI3DzbZVfsI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "geographic_msgs";
  version = "1.0.6-1";
  src = sources."geographic_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for Geographic Information Systems.";
  };
}
