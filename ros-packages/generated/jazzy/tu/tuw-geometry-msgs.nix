{
  ament-cmake,
  ament-cmake-cppcheck,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_geometry_msgs";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."tuw_geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "d65beba6f4b3c39214a3659aa414a106b7c70122";
        hash = "sha256-FQIY6YsQGo5W5NtDm49hu99UpvamNQJScJJHstKOs7s=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry_msgs package";
  };
})
