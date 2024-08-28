{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  glew,
  libjpeg_turbo,
  libpng,
  python3,
  substituteSource,
}:
let
  sources = rec {
    pangolin = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "4a5f472c7c48e921bcce34c2d9ddad4f0e130970";
        hash = "sha256-VAE6VKDuVagjFsw1q6X/hpGUYbDSIx+Os9F+/76bo08=";
      };
      substitutions = [
        {
          path = "scripts/vcpkg/ports/qca/portfile.cmake";
          from = "DOWNLOAD https://raw.githubusercontent.com/mozilla/gecko-dev/master/security/nss/lib/ckfw/builtins/certdata.txt";
          to = "DOWNLOAD file://${pangolin-vendor_source-certdata-0}";
        }
      ];
    };
    pangolin-vendor_source-certdata-0 = substituteSource {
      src = fetchurl {
        name = "pangolin-vendor_source-certdata-0-source";
        url = "https://raw.githubusercontent.com/mozilla/gecko-dev/master/security/nss/lib/ckfw/builtins/certdata.txt";
        hash = "sha256-RW/wld3m3XM1TFwoxz2cBvU7YagDljQUy5Gh2SlFzdM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pangolin";
  version = "0.9.1-3";
  src = sources.pangolin;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen python3 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ glew libjpeg_turbo libpng ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "libxkbcommon-dev" "wayland" "wayland-dev" ];
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
}
