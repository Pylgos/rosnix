{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  mkSourceSet,
  picknik-reset-fault-controller,
  picknik-twist-controller,
  robot-state-publisher,
  robotiq-description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_description";
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."kortex_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui joint-trajectory-controller picknik-reset-fault-controller picknik-twist-controller robot-state-publisher robotiq-description rviz2 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "kortex_description" = substituteSource {
        src = fetchgit {
          name = "kortex_description-source";
          url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
          rev = "819182cb6c4933cae39cd85e078838b614ec5ea6";
          hash = "sha256-eH7UKiSAo+QFISA/cyGSkHrLrr4LNrQRNQJoNIQrK8M=";
        };
      };
    });
  };
  meta = {
    description = "";
  };
})
