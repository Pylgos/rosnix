{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_msgs";
  version = "0.36.6-1";
  src = finalAttrs.passthru.sources."tf2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "89ffe0401d1c0ed17fd1eff930b976e2b12d7aee";
        hash = "sha256-xCO5QM3y7aNmJbl51bxJG6QqgPBFfonCJt06P7bYImU=";
      };
    };
  });
  meta = {
    description = "tf2_msgs";
  };
})
