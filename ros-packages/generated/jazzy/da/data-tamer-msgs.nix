{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_msgs";
  version = "0.9.4-4";
  src = finalAttrs.passthru.sources."data_tamer_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_msgs" = substituteSource {
      src = fetchgit {
        name = "data_tamer_msgs-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "38fab093efa7d483c5039f181a3a0254bdf6184a";
        hash = "sha256-NxB4rc0pONAAz2IJs4m7OQeB4K5aF+RNCRjmwkRbjLc=";
      };
    };
  });
  meta = {
    description = "Interfaces for data_tamer";
  };
})
