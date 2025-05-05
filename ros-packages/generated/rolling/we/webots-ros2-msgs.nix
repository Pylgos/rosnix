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
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs vision-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_msgs" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_msgs-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "d09fda47b863e3dd9b8b6b9db6841a393913cc6f";
        hash = "sha256-ukCcwPgzwNYFS/FYkMrz1uTzORHMeT8G19k+hByQoRM=";
      };
    };
  });
  meta = {
    description = "Services and Messages of the webots_ros2 packages.";
  };
})
