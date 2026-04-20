{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "continental_srvs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."continental_srvs";
  nativeBuildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "continental_srvs" = substituteSource {
      src = fetchgit {
        name = "continental_srvs-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "d2d7517b8fcb4760bc7ce7fad15a293daba2ef23";
        hash = "sha256-ZBp9JbrFigtMf7hd/8g3oYotiVFRyHAA6K/nH+wMsxw=";
      };
    };
  });
  meta = {
    description = "Services for Continental sensors";
  };
})
