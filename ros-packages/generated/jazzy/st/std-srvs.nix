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
  version = "5.3.5-1";
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
          rev = "8fc86bed667466d9fc6f8d56c36be60bcc6f59f2";
          hash = "sha256-vZj9EDZ4Q3C4tcVlUQ7EJdMmxFJ6yAnuNdvztWjedfA=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some standard service definitions.";
  };
})
