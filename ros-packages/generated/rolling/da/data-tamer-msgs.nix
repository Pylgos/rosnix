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
  version = "1.0.3-1";
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
        rev = "110d997bbb0c73d879b90f329e7d63beb115b636";
        hash = "sha256-DiNndorlR5AppYdAFG+TXQE1gcdZwaGbTHBfAVPenx8=";
      };
    };
  });
  meta = {
    description = "Interfaces for data_tamer";
  };
})
