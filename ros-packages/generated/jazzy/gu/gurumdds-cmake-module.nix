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
let
  sources = mkSourceSet (sources: {
    "gurumdds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "gurumdds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "9593663482e94b9ccd2901a1e033cba9eff24e3c";
        hash = "sha256-F9rv9B7x6Rv5rWdg3XWrctpfTUis1eLklzj+XaJdJDQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gurumdds_cmake_module";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."gurumdds_cmake_module";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provide CMake module to find GurumNetworks GurumDDS.";
  };
})
