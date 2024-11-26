{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "webots_ros2_msgs";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_msgs" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_msgs-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "bfee757a57bc766e9154ae58cdb753fa284f310c";
        hash = "sha256-JqQw9sZlQ+FC3E6cjgt+uIWAOIo71p5qQUTns/ppNZ8=";
      };
    };
  });
  meta = {
    description = "Services and Messages of the webots_ros2 packages.";
  };
})
