{
  automatika-ros-sugar,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kompass-interfaces,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "kompass";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."kompass";
  propagatedNativeBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  propagatedBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kompass" = substituteSource {
      src = fetchgit {
        name = "kompass-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "634771fcf118ecb2f6123af0a43f300a998a6163";
        hash = "sha256-Ipz0f2wrLzXD0njf+LYVYYTYvLx976Li6sblLVm34Bs=";
      };
    };
  });
  meta = {
    description = "Kompass: Event-driven navigation system";
  };
})
