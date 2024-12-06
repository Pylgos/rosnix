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
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_nav_msgs";
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."tuw_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "54b281fe7d1945ca355b4d6dae29206aa135a9f0";
        hash = "sha256-gfZAF7GMf2Wqu+t5NkJ0fr1Hg3mnuw0oFkfy4D6UTzA=";
      };
    };
  });
  meta = {
    description = "The tuw_nav_msgs package";
  };
})
