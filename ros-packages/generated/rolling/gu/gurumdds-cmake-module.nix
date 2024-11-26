{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gurumdds_cmake_module";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."gurumdds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gurumdds_cmake_module" = substituteSource {
        src = fetchgit {
          name = "gurumdds_cmake_module-source";
          url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
          rev = "857cd534f75670d423f94f18a3a262d7a06a7e80";
          hash = "sha256-F9rv9B7x6Rv5rWdg3XWrctpfTUis1eLklzj+XaJdJDQ=";
        };
      };
    });
  };
  meta = {
    description = "Provide CMake module to find GurumNetworks GurumDDS.";
  };
})
