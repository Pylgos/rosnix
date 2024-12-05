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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "50d6345e53257c9cd3a70d155bca8f16c0cb31b2";
        hash = "sha256-gfZAF7GMf2Wqu+t5NkJ0fr1Hg3mnuw0oFkfy4D6UTzA=";
      };
    };
  });
  meta = {
    description = "The tuw_nav_msgs package";
  };
})
