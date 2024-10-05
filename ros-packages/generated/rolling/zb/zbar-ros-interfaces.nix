{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  vision-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "zbar_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "zbar_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "b6f3834f9fc0e2b762ddeb051f4dbdc8ddadaa96";
        hash = "sha256-6sBmAGJ0hB7IGBjjimZbXMvWhYLLvQY03Rav/9hhxMg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "zbar_ros_interfaces";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."zbar_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime vision-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Package containing interfaces for zbar_ros to use to publish results";
  };
})
