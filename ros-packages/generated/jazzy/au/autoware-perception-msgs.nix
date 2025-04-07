{
  ament-cmake-auto,
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
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_perception_msgs";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_perception_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_perception_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_perception_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "28bc3c7eb0156d1032ff754dbaede2a6cb0ff039";
        hash = "sha256-nwoQCf2kLjF2XtMV6VXcKyA6rQYTF+xXkpZNdxgIx0U=";
      };
    };
  });
  meta = {
    description = "Autoware perception messages package.";
  };
})
