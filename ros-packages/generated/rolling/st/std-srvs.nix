{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "std_srvs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."std_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "std_srvs" = substituteSource {
        src = fetchgit {
          name = "std_srvs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "2bd5ca2155ca6ce575f0aa778ba9d21d3e963443";
          hash = "sha256-VaxgM4gc20BG2Hb31NHkmxsqY2BZ+dHeLOC/QwazYMc=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some standard service definitions.";
  };
})
