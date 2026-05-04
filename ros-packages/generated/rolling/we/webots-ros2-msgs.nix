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
  version = "2025.0.1-2";
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
        rev = "783b2b71273342cf321291824693078b5b6138a9";
        hash = "sha256-eCJjLF7RErgmW/as6D8Ed8nhGWUoWj+2EhZDWf4MpTo=";
      };
    };
  });
  meta = {
    description = "Services and Messages of the webots_ros2 packages.";
  };
})
